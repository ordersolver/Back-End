class CotizacionPdf
  include Prawn::View
  def initialize(datos)
    @lista = datos
    content
  end
  def content
    image "#{__dir__}/IMG/logo.png", :at => [40,720], :width => 500, :height => 100
    move_down 100
    text "NIT xxxxxxxxxxx", :align => :center
    move_down 4
    text "Telefono xxxxxxx", :align => :center
    move_down 4
    text "Carrera 23 # 45-48 SSR. Barrio Santa Lucia", :align => :center
    move_down 20
    text "<b>DOCUMENTO NO VALIDO PARA ENTREGA DE MERCANCIA</b>", :align => :center, :inline_format => true
    move_down 10
    text "Fecha generacion de cotizacion: #{DateTime.now.strftime("%d/%m/%Y")}", :align => :center
    move_down 10
    createtable
  end
  def createtable
    tabla = [[ "Id", "Descripcion", "Cantidad", "Precio Unit", "Precio Total"]]
    total=0
    @lista.each do |producto|
        tabla<<[ producto[:id] , producto[:descripcion], producto[:cantidad], producto[:preciounit], producto[:preciototal] ]
        total+=Integer(producto[:preciototal])
    end
    tabla<<["","","","TOTAL",total]

    table(tabla, position: :center) do
      style(row(-1).column(0..2), :border_width => 0)
    end

  end
end