import DevHubCore

protocol DependencyRegistration {
    func register(in container: DependencyContainer)
}
