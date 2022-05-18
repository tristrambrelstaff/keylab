class Admin < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable,
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  # Only people in the KEYPAD_ADMIN_WHITELIST environment variable are
  # allowed to sign up.  This list consists of their email addresses
  # separated by semicolons.
  validates(
    :email,
    inclusion: {
      in: ENV.fetch("KEYPAD_ADMIN_WHITELIST").split(";"),
      message: "is not on the KEYPAD_ADMIN_WHITELIST"
    }
  )


end
