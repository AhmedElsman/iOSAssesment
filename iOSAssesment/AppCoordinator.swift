import Foundation
import RxSwift

class AppCoordinator: BaseCoordinator {
    private let disposeBag = DisposeBag()
    private var window = UIWindow(frame: UIScreen.main.bounds)
    
    override func start() {
        window.makeKeyAndVisible()
        showDashboard()
    }
    
    private func showDashboard() {
        removeChildCoordinators()
        let coordinator = HomeCoordinator(homeViewModel: HomeViewModel())
        coordinator.navigationController = BaseNavigationController()
        start(coordinator: coordinator)
        
        ViewControllerUtils.setRootViewController(
            window: window,
            viewController: coordinator.navigationController,
            withAnimation: true)
    }
}
