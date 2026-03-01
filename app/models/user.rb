class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # 0 = atendente, 1 = gerente
  enum :role, { atendente: 0, gerente: 1 }
end
