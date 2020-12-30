module PartsHelper
  def quantity_field(part)
    project_part = @project.project_parts.find_by(part_id: part.id)
    project_part.quantity
  end
end
