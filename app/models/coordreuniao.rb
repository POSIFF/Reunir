class Coordreuniao < ApplicationRecord
	has_many :reunioes

	validates_presence_of :matricula, message: "deve ser preenchida"
	validates_presence_of :nome, message: "deve ser preenchido"
	validates_presence_of :funcao, message: "deve ser preenchida"

	mount_uploader :foto, FotoCoordenadorUploader
	
end
