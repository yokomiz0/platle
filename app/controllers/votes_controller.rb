class VotesController < ApplicationController

  def show
    code = params[:code] # 87293749273aosf87234ja983
    ve = VoteEvent.find_by(:code => code)
    # 投票イベントが存在するか？
    raise ActiveRecord::RecordNotFound unless ve.present?
    
    # 最大投票数チェック
    
    # クッキーをみて 投票権利があるか?
    
    @vote = Vote.new({code: code})
    @options = ve.options.split(',')
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
  
  private 
  
  def vote_params
    #params.require(:vote).permit(:code, :shop)
  end
end

