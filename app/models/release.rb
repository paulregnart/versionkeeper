class Release < ActiveRecord::Base
  belongs_to :user
  attr_accessible :accounts, :accounts_extra, :addons, :collaborate, :date, :help, :mysageone, :notes, :payroll
  validates_presence_of :date
  paginates_per 10

  def self.version app, date
    self.where("#{app} != '' AND date <= ?", date).pluck(app).sort_by(&:to_i).last || "-"
  end
end
