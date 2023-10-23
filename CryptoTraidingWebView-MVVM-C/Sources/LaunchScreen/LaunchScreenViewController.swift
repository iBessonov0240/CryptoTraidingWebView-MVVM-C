//
//  LaunchScreenViewController.swift
//  CryptoTraidingWebView-MVVM-C
//
//  Created by i0240 on 22.10.2023.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    var delegateRouting: LaunchScreenRoutingDelegate!

    // MARK: - Outlets

    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Theme.launchScreenImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.0, animated: false)
        progressView.tintColor = Theme.greenColor
        progressView.layer.cornerRadius = 12
        progressView.clipsToBounds = true
        return progressView
    }()

    private var progressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        animateProgressBar()
        setupNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func animateProgressBar() {
        var currentProgress: Float = 0.0

        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if currentProgress < 1.0 {
                currentProgress += 0.01
                self.progressView.setProgress(currentProgress, animated: true)
                let percentage = Int(currentProgress * 100)
                self.progressLabel.text = "\(percentage)%"
            } else {
                timer.invalidate()
                self.progressView.isHidden = true
                self.progressLabel.isHidden = true
                self.showPushNotificationRequest()
            }
        }
    }

    private func showPushNotificationRequest() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, error in
            if let error = error {
                print(error.localizedDescription)
            } else if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
            self?.delegateRouting.routeToTabBar()
        }
    }

    private func setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func setupHierarchy() {
        view.addSubviews(backgroundImageView, progressView, progressLabel)
    }

    private func setupLayout() {
        backgroundImageView.addConstraints(
            top: view.topAnchor,
            leading: view.leadingAnchor,
            trailing: view.trailingAnchor,
            bottom: view.bottomAnchor
        )

        progressView.addConstraints(
            leading: view.leadingAnchor,
            paddingLeft: 35,
            trailing: view.trailingAnchor,
            paddingRight: 35,
            centerX: view.centerXAnchor,
            centerY: view.centerYAnchor,
            height: 24
        )

        progressLabel.addConstraints(
            centerX: progressView.centerXAnchor,
            centerY: progressView.centerYAnchor
        )
    }
}
