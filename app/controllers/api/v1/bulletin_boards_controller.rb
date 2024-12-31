module Api
  module V1
    # 掲示板機能に関するAPIエンドポイントを提供
    class BulletinBoardsController < ApplicationController
      before_action :set_bulletin_board, only: [:show, :update, :destroy]

      # GET /api/v1/bulletin_boards
      def index
        bulletin_boards = BulletinBoard.all
        render json: bulletin_boards, status: :ok
      end

      # GET /api/v1/bulletin_boards/:id
      def show
        render json: @bulletin_board, status: :ok
      end

      # POST /api/v1/bulletin_boards
      def create
        @bulletin_board = current_user.bulletin_boards.build(bulletin_board_params)
        if @bulletin_board.save
          render json: @bulletin_board, status: :created
        else
          render json: { errors: @bulletin_board.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/bulletin_boards/:id
      def update
        if @bulletin_board.update(bulletin_board_params)
          render json: @bulletin_board, status: :ok
        else
          render json: { errors: @bulletin_board.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/bulletin_boards/:id
      def destroy
        @bulletin_board.destroy
        head :no_content
      end

      def mark_as_read
        bulletin_board = BulletinBoard.find(params[:id])
        if bulletin_board.update(is_read: true)
          render json: { message: 'Marked as read successfully' }, status: :ok
        else
          render json: { errors: bulletin_board.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_bulletin_board
        @bulletin_board = BulletinBoard.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: '掲示板が見つかりませんでした' }, status: :not_found
      end

      def bulletin_board_params
        # user_idを許可しない（current_userに自動的に関連付けるため）
        params.require(:bulletin_board).permit(:title, :content, files: [])
      end
    end
  end
end
