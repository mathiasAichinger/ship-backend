class BuildWorker
  include Sidekiq::Worker
  def perform(build_id)
    puts "#{build_id}".red
    build = Build.find(build_id)
    lane = build.lane
    actions = lane.actions
    lane_template = lane.lane_template
    processing_template = lane_template.root_action_template
    processing_action = actions.select { |action| action.action_template.id == processing_template.id }.first

    finished = false

    per_lane = 100.0/actions.count

    build_counter = 0
    counter = 0

    while !finished do
      counter += 1
      build_counter += 1
      processing_action.progress = (counter/per_lane)*100
      puts "action #{processing_action.progress}".red
      if processing_action.progress == 100
        processing_action.status = "successful"
        build.endDate = Time.now
        processing_action.save
        unless processing_template.child.nil?
          processing_template = processing_template.child
          processing_action = actions.select { |action| action.action_template.id == processing_template.id }.first
          counter = 0
        end
      else
        processing_action.save
      end

      build.progress = build_counter;
      puts "#{build.progress}".red
      if build.progress == 100
        build.status = "successful"
        build.endDate = Time.now
      end
      build.save

      finished = build.progress == 100
      sleep 1
    end
  end
end