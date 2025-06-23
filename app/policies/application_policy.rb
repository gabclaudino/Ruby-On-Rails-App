class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user   = user
    @record = record
  end

  # —————— Permissões básicas ——————
  def index?;  false; end
  def show?;   false; end
  def create?; false; end
  def new?;    create?; end     # <-- alias
  def update?; false; end
  def edit?;   update?; end     # <-- alias
  def destroy?; false; end

  # —————— Escopo padrão: todo mundo vê tudo ——————
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
