class StatisticsPdf
    include Prawn::View

    def initialize(datos)
        @lista = datos
        content
    end


    def content
        image "#{__dir__}/IMG/logo.png", :at => [40,720], :width => 269, :height => 104
        move_down 120
        text "#{@lista[:title]}", :align => :center
        move_down 10
        svg @lista[:svg], :width => 500, :height => 100, :align => :center
    end
    
end