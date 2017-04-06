class Api::V1::RestaurentsController < Api::V1::BaseController
  def index
    data = Restaurent.get_restaurents
    sorted_data_by_review_count = data.sort_by! { |k| k[:review_count]}
    @sorted_data_by_review_count_json = sorted_data_by_review_count.to_json
    render json: @sorted_data_by_review_count_json
  end
end
