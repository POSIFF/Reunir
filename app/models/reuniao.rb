class Reuniao < ApplicationRecord
	belongs_to :gerencia
	belongs_to :coordreuniao
	belongs_to :usuario
	has_many :pautas
	has_many :atas

	validates_presence_of :codigo, message: "deve ser preenchido."
	validates_presence_of :descricao, message: "deve ser preenchida."
	validates_presence_of :data, message: "deve ser preenchida."
	validates_presence_of :hora, message: "deve ser preenchida."
	validates_presence_of :local, message: "deve ser preenchido."
	validates_presence_of :convidados, message: "devem ser informados."
	validates_presence_of :observacoes, message: "deve ser preenchido."
end
 