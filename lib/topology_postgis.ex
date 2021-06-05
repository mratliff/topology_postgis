defmodule TopologyPostgis do
  @moduledoc """
  Documentation for `TopologyPostgis`.
  """

  defmacro addedge(topology, line) do
    quote do: fragment("topology.addedge(?, ?)", unquote(topology), unquote(line))
  end

  defmacro addface(topology, geometry, force_new \\ false) do
    quote do:
            fragment(
              "topology.addface(?, ?, ?)",
              unquote(topology),
              unquote(geometry),
              unquote(force_new)
            )
  end

  defmacro addnode(topology, point) do
    quote do: fragment("topology.addnode(?, ?)", unquote(topology), unquote(point))
  end

  defmacro addnode(topology, point, allow_edge_splitting, set_containing_face \\ false) do
    quote do:
            fragment(
              "topology.addnode(?, ?)",
              unquote(topology),
              unquote(point),
              unquote(allow_edge_splitting),
              unquote(set_containing_face)
            )
  end

  defmacro addtopogeometrycolumn(topology_name, schema, table, column, layer_type, child \\ NULL) do
    quote do:
            fragment(
              "topology.addtopogeometrycolumn(?, ?, ?, ?, ?)",
              unquote(topology_name),
              unquote(schema),
              unquote(table),
              unquote(column),
              unquote(layer_type),
              unquote(child)
            )
  end

  defmacro addsearchpath(schema_name) do
    quote do: fragment("topology.addsearchpath(?)", unquote(schema_name))
  end

  defmacro asgml(topo_geometry) do
    quote do: fragment("topology.asgml(?)", unquote(topo_geometry))
  end

  defmacro asgml(topo_geometry, name_space_prefix) do
    quote do: fragment("topology.asgml(?, ?)", unquote(topo_geometry), unquote(name_space_prefix))
  end

  defmacro asgml(topo_geometry, name_space_prefix, precision) do
    quote do:
            fragment(
              "topology.asgml(?, ?, ?)",
              unquote(topo_geometry),
              unquote(name_space_prefix),
              unquote(precision)
            )
  end

  defmacro asgml(topo_geometry, name_space_prefix, precision, options) do
    quote do:
            fragment(
              "topology.asgml(?, ?, ?, ?)",
              unquote(topo_geometry),
              unquote(name_space_prefix),
              unquote(precision),
              unquote(options)
            )
  end

  defmacro asgml(topo_geometry, name_space_prefix, precision, options, visited_table) do
    quote do:
            fragment(
              "topology.asgml(?, ?, ?, ?, ?)",
              unquote(topo_geometry),
              unquote(name_space_prefix),
              unquote(precision),
              unquote(options).unquote(visited_table)
            )
  end

  defmacro asgml(topo_geometry, name_space_prefix, precision, options, visited_table, id_prefix) do
    quote do:
            fragment(
              "topology.asgml(?, ?, ?, ?, ?, ?)",
              unquote(topo_geometry),
              unquote(name_space_prefix),
              unquote(precision),
              unquote(options),
              unquote(visited_table),
              unquote(id_prefix)
            )
  end

  defmacro asgml(
             topo_geometry,
             name_space_prefix,
             precision,
             options,
             visited_table,
             id_prefix,
             gml_version
           ) do
    quote do:
            fragment(
              "topology.asgml(?, ?, ?, ?, ?, ?, ?)",
              unquote(topo_geometry),
              unquote(name_space_prefix),
              unquote(precision),
              unquote(options),
              unquote(visited_table),
              unquote(id_prefix),
              unquote(gml_version)
            )
  end

  defmacro astopojson(topo_geometry, edge_map_table) do
    quote do:
            fragment("topology.astopojson(?, ?)", unquote(topo_geometry), unquote(edge_map_table))
  end

  defmacro cleartopogeometry(topo_geometry) do
    quote do: fragment("topology.cleartopogeometry(?)", unquote(topo_geometry))
  end

  defmacro copytoplogy(topology, new_topology) do
    quote do: fragment("topology.copytopology(?, ?)", unquote(topology), unquote(new_topology))
  end

  defmacro createtopogeom(topology, tg_type, layer_id) do
    quote do:
            fragment(
              "topology.createtopogeom(?, ?, ?)",
              unquote(topology),
              unquote(tg_type),
              unquote(layer_id)
            )
  end

  defmacro createtopogeom(topology, tg_type, layer_id, tg_objs) do
    quote do:
            fragment(
              "topology.createtopogeom(?, ?, ?, ?)",
              unquote(topology),
              unquote(tg_type),
              unquote(layer_id),
              unquote(tg_objs)
            )
  end

  defmacro createtopology(topology) do
    quote do:
            fragment(
              "topology.createtopology(?)",
              unquote(topology)
            )
  end

  defmacro createtopology(topology, srid) do
    quote do:
            fragment(
              "topology.createtopology(?, ?)",
              unquote(topology),
              unquote(srid)
            )
  end

  defmacro createtopology(topology, srid, precision, hasz) do
    quote do:
            fragment(
              "topology.createtopology(?, ?, ?, ?)",
              unquote(topology),
              unquote(srid),
              unquote(precision),
              unquote(hasz)
            )
  end

  defmacro droptopologycolumn(schema, table, column) do
    quote do:
            fragment(
              "topology.droptopologycolumn(?, ?, ?)",
              unquote(schema),
              unquote(table),
              unquote(column)
            )
  end

  defmacro droptopology(topology) do
    quote do:
            fragment(
              "topology.droptopology(?)",
              unquote(topology)
            )
  end

  defmacro equals(topogeometry1, topogeometry2) do
    quote do:
            fragment(
              "topology.equals(?, ?)",
              unquote(topogeometry1),
              unquote(topogeometry2)
            )
  end

  defmacro geometry(topogeometry) do
    quote do:
            fragment(
              "topology.geometry(?)",
              unquote(topogeometry)
            )
  end

  defmacro geometrytype(topogeometry) do
    quote do:
            fragment(
              "topology.geometrytype(?)",
              unquote(topogeometry)
            )
  end

  defmacro getedgebypoint(topology, point, tolerance) do
    quote do:
            fragment(
              "topology.getedgebypoint(?, ?, ?)",
              unquote(topology),
              unquote(point),
              unquote(tolerance)
            )
  end
end
