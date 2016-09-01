class VoteEventsController < ApplicationController

    def index
        @vote_event = VoteEvent.new

        # search Gurunavi API
        if params.has_key?('area') and params.has_key?('num_of_people')
            c = HTTPClient.new
            res = c.get_content 'http://api.gnavi.co.jp/RestSearchAPI/20150630/', {keyid: "abe39b760df16dddc4e98f77e418baba", pref:"PREF40", freeword: params["area"], format:"json"}
            res = JSON.parse(res)
            if res.has_key?('error')
                @error = res['error']['message']
            else
                @vote_event.area = params['area']
                @vote_event.num_of_people = params['num_of_people']
            ## 選択肢の絞込をする
                @shops = res['rest'].first(3)
            ## 店舗登録
                @shops.each do |shop|
                    Shop.find_or_create_by(code: shop['id']) do |s|
                        s.code = shop['id']
                        s.name = shop['name']
                        s.address = shop['address']
                        s.image = shop['shop_image1']
                        s.url = shop['url']
                    end
                end
            end
        end
    end

    def create
        # 投票イベント登録
        @ve = VoteEvent.new(vote_event_params)
            if @ve.save
            redirect_to @ve
            else
            render 'index'
        end
    end

    def show
        @ve = VoteEvent.find(params[:id])
    end

    def cancel
    end

    private

    def vote_event_params
        params.require(:vote_event).permit(:area, :num_of_people, :options)
    end

end
