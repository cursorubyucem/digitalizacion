class Foto < ActiveRecord::Base
  has_paper_trail

  has_attached_file :foto, 
  					styles: { medium: "300x300>", thumb: "100x100"},
  					default_url: "/images/:style/missing.png"


end
