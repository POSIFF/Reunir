class Gerencia < ApplicationRecord
	has_many :reunioes
	validates_uniqueness_of :sigla, message: "Gerência existente. Crie uma outra."
	validates_uniqueness_of :descricao, message: "Gerência existente. Crie uma outra."
	validates_presence_of :sigla, message: "deve ser preenchida."
	validates_presence_of :descricao, message: "deve ser preenchida."

end
