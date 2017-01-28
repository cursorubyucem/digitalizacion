class Documento < ActiveRecord::Base
	has_paper_trail
	belongs_to :establecimiento

	has_attached_file :archivo, styles: {}, 
		path: '/home/ruby/archivos/:id.:extension', 
		url:'/home/ruby/archivos/:id.:extension'


  	validates_attachment :archivo, presence: true, 
  	content_type: { content_type: "application/pdf" }

end
