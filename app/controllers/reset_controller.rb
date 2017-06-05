class ResetController < ApplicationController
  def index
  end

  def update
    @status = Status.where('id = ?', 1)
    @status.update(hot: 0, cold: 0)
    redirect_to controller: 'reset', action: 'index', notice: '失礼しました。熱盛と出てしまいました。'
  end
end
