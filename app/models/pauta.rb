class Pauta < ApplicationRecord
	belongs_to :reuniao
	validates_presence_of :codigo, message: "deve ser preenchido."
	validates_presence_of :descricao, message: "deve ser preenchida."
	validates_presence_of :autor, message: "deve ser preenchido."
end
