class Post < ActiveRecord::Base
    
    validates_presence_of :title
    validates_presence_of :category
    validates_presence_of :body
    
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }#, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    has_many :comments
    belongs_to :category
    belongs_to :user
end
