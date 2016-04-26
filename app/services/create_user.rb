class CreateUser
    def self.call(email_address)

        user = User.find_by(email: email_address)

        return user if user.present?
            raw_token, enc_token = Devise.token_generator.generate(
        User, :reset_password_token)

        password = SecureRandom.hex(32)
        user = User.create!(
        email: email_address,
        password: password,
        password_confirmation: password,
        reset_password_token: enc_token,
        reset_password_sent_at: Time.now
        )
        return user, raw_token
    end
end