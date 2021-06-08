//
//  SwiperModel.swift
//  App
//
//  Created by ggamangmuri on 2021/06/08.
//

import SwiftUI

struct PageControl: UIViewRepresentable {
    var page: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        
        let view = UIPageControl()
        view.currentPageIndicatorTintColor = .black
        //view.currentPageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
        view.pageIndicatorTintColor = .gray
        view.numberOfPages = 3
        return view
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        
        DispatchQueue.main.async {
            uiView.currentPage = self.page
        }
    }
}

struct PageViewController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    var paging: PageControl
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        return pageViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([controllers[1]], direction: .forward, animated: true)
    }
    
    typealias UIViewControllerType = UIPageViewController
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}


class Coordinator: NSObject, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = self.parent.controllers.firstIndex(of: viewController) else { return nil }
        if index == 0 {
            //return self.parent.controllers.last
            return nil
        }
        return self.parent.controllers[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.parent.controllers.firstIndex(of: viewController) else { return nil }
        if index == self.parent.controllers.count - 1 {
            //return self.parent.controllers.first
            return nil
        }
        return self.parent.controllers[index+1]
    }
    
    var parent: PageViewController
    
    init(_ parent: PageViewController) {
        self.parent = parent
    }
}
