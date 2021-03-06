class Setting < ActiveRecord::Base
  after_save :reload

  validates :keyname, :value, presence: true
  validates :keyname, uniqueness: true

  protected

  def reload
    AppConfig.reload
  end
end
