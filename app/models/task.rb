class Task < ApplicationRecord
  belongs_to :project

#  def completed?
#    !completed_at.blank?
#  #  !done.blank?
#  end


  #def left_days
	#  if (task.deadline && !task.status)
	#    write_attribute :left_days, "left "+(task.deadline.to_date - Time.now.to_date).to_i.to_s + " day".pluralize((task.deadline.to_date - Time.now.to_date).to_i)
	#  end
#end

end
