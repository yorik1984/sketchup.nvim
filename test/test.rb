# frozen_string_literal: true

module Example
  unless file_loaded?(__FILE__)
    menu = UI.menu('Plugins')
    menu.add_item('Example') { hello }
    file_loaded(__FILE__)
  end

  def self.hello
    puts 'Hello World'
  end

  entities       = Sketchup.model.active_entities
  group          = entities.add_group
  group.entities.add_face([0, 0, 0], [100, 0, 0], [100, 100, 0], [0, 100, 0])
  instance       = group.to_component
  transformation = instance.transformation
  edge           = instance.definition.entities.grep(Sketchup::Edge).first
  instance_path  = Sketchup::InstancePath.new([instance, edge])
  start_point    = edge.start.position.transform(transformation)
  end_point      = edge.end.position.transform(transformation)
  vector         = Geom::Vector3d.new(0, 30, 0)
  Sketchup.model.active_entities.add_dimension_linear(
    [instance_path, start_point], [instance_path, end_point], vector
  )
end
