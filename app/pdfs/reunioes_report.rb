class ReunioesReport < Prawn::Document

  def initialize(reunioes)
    super()
    @reunioes = reunioes
    header
    text_content
    table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/header.jpg", width: 530, height: 100
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    bounding_box([0, y_position], :width => 540, :height => 50) do
      text "Reunir", size: 15, style: :bold
      text "Listagem de Reuniões", size: 12, style: :bold
    end



  end

  def table_content
    # This makes a call to reuniao_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table reuniao_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [200, 100, 200]
    end
  end

  def reuniao_rows
    [['Descrição','Data', 'Coordenador' ]] +
    @reunioes.map do |reuniao|
      [reuniao.descricao,reuniao.data, reuniao.coordreuniao.nome]
    end
  end
end