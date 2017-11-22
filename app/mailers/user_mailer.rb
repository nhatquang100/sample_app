class UserMailer < ApplicationMailer
  def account_activation user
    @user = user
    mail to: user.email, subject: t("mailers.user_mailer.subj")
  end

  def password_reset
    @greeting = t "mailers.user_mailer.hi"
    mail to: "to@example.org"
  end
end
