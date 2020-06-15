# frozen_string_literal: true

class TimerTaskJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = FlowCore::Task.find(task_id)
    return unless task.enabled?
    return if task.errored? || task.suspended?

    task.finish!
  end
end
