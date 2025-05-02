# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  descripcion    :string
#  fecha_creacion :datetime
#  titulo         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  audited
  belongs_to :user
  # validate if attribute name is present
  def name
    self.id
  end
  def self.ransackable_attributes(auth_object = nil)
    %w[titulo descripcion fecha_creacion user_id]
  end
  def self.ransackable_associations(auth_object = nil)
    %w[user]
  end

  def get_pdf

    pdf = HexaPDF::Document.new

    page = pdf.pages.add
    canvas = page.canvas

    # Estilos generales
    canvas.font('Helvetica', size: 12)

    # Cabecera tipo entidad financiera
    # canvas.font('Helvetica-Bold', size: 18)
    canvas.fill_color(0, 0, 0.5) # azul oscuro
    #canvas.text("Entidad Financiera - Detalle de Publicación", at: [50, 750])

    # Línea separadora
    canvas.line_width(1)
    canvas.stroke_color(0.2, 0.2, 0.2)
    canvas.line(50, 740, 550, 740).stroke

    # Información del post
    canvas.fill_color(0, 0, 0)
    # canvas.font('Helvetica', size: 12)

    y = 710
    line_height = 20

    canvas.text("ID: #{self.id}", at: [50, y])
    y -= line_height
    canvas.text("Título: #{self.titulo}", at: [50, y])
    y -= line_height
    canvas.text("Descripción: #{self.descripcion}", at: [50, y])
    y -= line_height
    canvas.text("Fecha de Creación: #{self.fecha_creacion.strftime('%d/%m/%Y')}", at: [50, y])
    y -= line_height
    canvas.text("Creado el: #{self.created_at.strftime('%d/%m/%Y %H:%M')}", at: [50, y])
    y -= line_height
    canvas.text("Actualizado el: #{self.updated_at.strftime('%d/%m/%Y %H:%M')}", at: [50, y])
    y -= line_height
    canvas.text("Usuario ID: #{self.user_id}", at: [50, y])

    # Footer
    # canvas.font('Helvetica-Oblique', size: 10)
    canvas.fill_color(0.5)
    canvas.text("Documento generado automáticamente - #{Time.current.strftime('%d/%m/%Y')}", at: [50, 50])

    # Enviar el PDF
    pdf.write("hello-world.pdf")
    #data = pdf.write

    
    # doc = HexaPDF::Document.new
    # canvas = doc.pages.add.canvas
    # canvas.font('Helvetica', size: 100)
    # canvas.text("Hello World!", at: [20, 400])
    # doc.write("hello-world.pdf")
  end

end
