class User < ApplicationRecord
    before_save :downcase_email
    has_secure_password
    validacion_email = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :name, presence: true
    validates :email, presence: true, format: {with: validacion_email}, uniqueness: {case_sensitive: false}, length: {maximum: 100}
    validates :password, length: {minimun: 6,maximum:20}, presence: true, allow_nil: true

    private

    def downcase_email
        self.email.downcase!
    end
end
