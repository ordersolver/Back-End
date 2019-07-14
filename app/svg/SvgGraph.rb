class SvgGraph
    require 'SVG/Graph/Bar'
    def initialize(datos)
        x_axis= datos[:x_axis]
        options = {
            :width             => 800,
            :height            => 600,
            :stack             => :side,  # the stack option is valid for Bar graphs only
            :fields            => x_axis,
            :graph_title       => "",
            :show_graph_title  => true,
            :scale_integers    => true,
            :show_x_title      => false,
            :stagger_x_labels => false,
            :rotate_x_labels   => false,
            :x_title_location  => :end,
            :show_y_title      => false,
            :y_title_location  => :end,
            :add_popups        => false,
            :no_css            => true,
            # :x_axis_position   => 0,
            # :y_axis_position   => '30-50',
        }
        data=datos[:data]
        @graph = SVG::Graph::Bar.new(options)
        @graph.add_data({
            :data => data,
        })
        # f=File.open("./app/svg/test_file.svg","w+"){|f|
        #     f.print(@graph.burn_svg_only)
        # }
    end

    def get_svg
        @graph.burn_svg_only
    end


end
