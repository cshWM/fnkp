class Athlete < ActiveRecord::Base
  belongs_to :club
  before_save { self.short_name = short_name.downcase if self.short_name}

  belongs_to :altered_by_user, :class_name => 'User', :foreign_key => :altered_by

  validates :name, length: { maximum: 250 }, presence: true
  validates :short_name, length: { maximum: 25 }
  validates :sex, :inclusion => {:in => ['male', 'female']}, presence: true

  validates :import_code, length: { maximum: 25 }
  validates :fnkp_code, numericality: {only_integer: true, greater_than: 0}, length: { maximum: 10 },
                uniqueness: { case_sensitive: false,
                  message: "não podem existir dois atletas com o mesmo código FNKP"  }
  validates :cc_code, length: { maximum: 20, minimum: 6},
                uniqueness: { case_sensitive: false,
                  scope: :club_id, message: "não podem existir dois atletas com o mesmo CC no mesmo clube"  }
  validates :birthdate,
              :timeliness => {
                :before => lambda { 1.years.ago },
                :before_message => "tem de ter pelo menos 1 ano",
                #:after => lambda { 100.years.ago },
                #:after => "não pode ter mais do que 100 anos",
                :type => :date
              }

  validates :active, :inclusion => {:in => [true, false]}
  validates :national, :inclusion => {:in => [true, false]}
  validates :is_current, :inclusion => {:in => [true, false]}

end
