class VotesController < ApplicationController

  def show
    code = params[:code] # 87293749273aosf87234ja983
    ve = VoteEvent.where(:code => code)

    # 投票イベントが存在するか？
    unless ve.present?
      # 404エラー
    end

    # クッキーをみて 投票権利があるか?
  end

  def vote
    #
    v = Vote.new(vote_params)
    if v.save
    else
    end
  end

  def finish
  end
end
