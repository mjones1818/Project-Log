module ProjectsHelper
  def format_time(date)
    date.strftime("%m/%d/%y %H:%M")
  end

  def quantity(part)
    ProjectPart.where(project_id: @project.id, part_id: part.id).first.quantity
  end
end
