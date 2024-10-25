class User < ApplicationRecord
  # Deviseモジュールの設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ニックネーム（name）のバリデーション：必須
  validates :name, presence: true

  # 姓（last_name）のバリデーション：必須、全角（漢字・ひらがな・カタカナ）での入力を要求
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }

  # 名（first_name）のバリデーション：必須、全角（漢字・ひらがな・カタカナ）での入力を要求
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters." }

  # 姓のカナ（last_name_kana）のバリデーション：必須、全角カタカナでの入力を要求
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }

  # 名のカナ（first_name_kana）のバリデーション：必須、全角カタカナでの入力を要求
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters." }

  # 生年月日（birth_date）のバリデーション：必須
  validates :birth_date, presence: true

  # パスワードのバリデーション：英字と数字を含むことを要求
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
end
