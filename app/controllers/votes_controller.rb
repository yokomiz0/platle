class VotesController < ApplicationController

  def show
    code = params[:code] # 87293749273aosf87234ja983
    ve = VoteEvent.find_by(:code => code)

    # 投票イベントが存在するか？
    raise ActiveRecord::RecordNotFound unless ve.present?

    # 投票受付終了済みか？
    vote_max = Vote.where(code: code).count
    if vote_max >= ve.max_vote
      render 'end'
      return
    end

    # クッキーをみて 投票済みかどうか？
    voted_events = cookies[:voted_events] || []
    if voted_events.include?(code)
      render 'voted'
      return
    end

    @vote = Vote.new({code: code})
    @options = ve.options.split(',')

    render 'show'
  end

  def create
    # 投票結果登録
    code = vote_params[:code]
    v = Vote.new(vote_params)
    if v.save
      # クッキーに投票済み情報を記録
      voted_events = cookies[:voted_events] || []
      cookies[:voted_events] = voted_events.push(code)

      redirect_to votes_finish_path
    else
      ve = VoteEvent.find_by(code: code)
      @voted = voted_events.split(',').include?(code)
      @vote = Vote.new({vote_event_id: code})
      @options = ve.options.split(',')
      render 'show'
    end
  end

  def finish

  end

  private

  def vote_params
    params.require(:vote).permit(:code, :shop)
  end
end
