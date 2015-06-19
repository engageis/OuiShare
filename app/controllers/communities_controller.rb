class CommunitiesController < ApplicationController
  include AutoHtml
  def index
    @community_page = @current_language.community_page || CommunityPage.new
    @communities = @current_language.communities
    @regions = Region.all
    @communities_for_select = Community.all
  end

  def get_communities_select
    region = Region.find(params[:region_id])
    # map to name and id for use in our options_for_select
    @communities_for_select = region.communities.map{|a| [a.id, a.name]}
    respond_to do |format|
      format.json { render json: @communities_for_select.to_json}
    end
  end

  def get_community_partial
    community = Community.find(params[:community_id])
    users = community.users
    render partial: 'communities/community', locals:{community: community}
  end

  def local
  end

  def communities
  end

  def ouishare
  end

  def live
    @live_page = @current_language.live_page || LivePage.new
  end

  def people
  end

  def expert_groups
    @expert_groups_page = @current_language.expert_groups_page || ExpertGroupsPage.new
    @expert_groups = @current_language.expert_groups
  end
end
