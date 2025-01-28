//
//  ViewController.swift
//  GlintBubbleGame
//
//  Created by student-2 on 16/01/25.
//

import UIKit
import SpriteKit

class BubbleViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var gameView: UIView!
    
    var score = 0
    var timeRemaining = 60
    var timer: Timer?
    var bubbleTimer: Timer?
    var skView: SKView!
    var gameScene: SKScene!
    var startButton: UIButton!
    var favouriteButton: UIButton!
    var isFavourite : Bool?
    var Gametitle: String?
        override func viewDidLoad() {
            super.viewDidLoad()
            setupSpriteKit()
            setupBackButton()
            setupStartButton()
            setupFavouriteButton()
            hideGameElements()
            isFavourite = UserDataManager.shared.getFavourite(gameTitle: Gametitle!)
            if let isFavourite = isFavourite {
                    if isFavourite {
                        favouriteButton.setTitle("Added!", for: .normal)  // Favorite selected
                    } else {
                        favouriteButton.setTitle("Favourite", for: .normal)  // Not favorite
                    }
                }
            //print("\(String(describing: isFavourite))")
        }
        
        private func setupStartButton() {
            startButton = UIButton(type: .system)
            startButton.setTitle("Start Game", for: .normal)
            startButton.setTitleColor(.white, for: .normal)
            startButton.backgroundColor = .systemGreen
            startButton.layer.cornerRadius = 10
            startButton.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
            startButton.center = view.center
            startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
            
            view.addSubview(startButton)
        }
        
    private func setupFavouriteButton() {
        favouriteButton = UIButton(type: .system)
        favouriteButton.setTitle("Favourite", for: .normal)
        favouriteButton.setTitleColor(.white, for: .normal)
        favouriteButton.backgroundColor = .systemBlue
        favouriteButton.layer.cornerRadius = 8
        favouriteButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        favouriteButton.frame = CGRect(x: view.frame.width - 125, y: 50, width: 110, height: 40)
        favouriteButton.addTarget(self, action: #selector(toggleFavourite), for: .touchUpInside)
        
        view.addSubview(favouriteButton)
    }

        
    @objc private func toggleFavourite() {
        // Toggle the favourite status
        isFavourite?.toggle()
        
        // Set the new button title based on the updated status
        let newTitle = isFavourite == true ? "Added!" : "Favourite"
        favouriteButton.setTitle(newTitle, for: .normal)
        
        // Print the current favourite status
        //print("Favourite status: \(isFavourite == true ? "Added!" : "Favourite")")
        
        // Safely unwrap the gameTitle using if let
        if let gameTitle = Gametitle {
            // Call the update method in UserDataManager with the safely unwrapped gameTitle
            UserDataManager.shared.toggleFavourite(gameTitle: gameTitle)
            UserDataManager.shared.populateFav()
            NotificationCenter.default.post(name: NSNotification.Name("FavGamesUpdated"), object: nil)
        } else {
            print("Error: gameTitle is nil")
        }
    }


        
        @objc private func startButtonTapped() {
            startButton.isHidden = true
            showGameElements()
            setupGame()
        }
        
        private func hideGameElements() {
            scoreLabel.isHidden = true
            timerLabel.isHidden = true
            gameView.isHidden = true
        }
        
        private func showGameElements() {
            scoreLabel.isHidden = false
            timerLabel.isHidden = false
            gameView.isHidden = false
        }
        
        func setupGame() {
            score = 0
            timeRemaining = 60
            scoreLabel.text = "Score: \(score)"
            timerLabel.text = "Time: \(timeRemaining)"
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            bubbleTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(createBubble), userInfo: nil, repeats: true)
        }
        
        private func setupBackButton() {
            let backButton = UIButton(type: .system)
            backButton.setTitle("Back", for: .normal)
            backButton.setTitleColor(.white, for: .normal)
            backButton.backgroundColor = .systemBlue
            backButton.layer.cornerRadius = 8
            backButton.frame = CGRect(x: 20, y: 50, width: 80, height: 40)
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            view.addSubview(backButton)
        }
        
        @objc private func backButtonTapped() {
            dismiss(animated: true, completion: nil)
        }
    
    func endGame() {
        timer?.invalidate()
        bubbleTimer?.invalidate()
        timer = nil
        bubbleTimer = nil
        gameScene.removeAllChildren()
        
        let alert = UIAlertController(title: "Game Over!", message: "Your score: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: .default) { [weak self] _ in
            self?.resetGame()
        })
        present(alert, animated: true)
    }
    
    private func resetGame() {
        startButton.isHidden = false
        hideGameElements()
    }
    
    func setupSpriteKit() {
        // Create SKView with autoresizing
        skView = SKView(frame: gameView.bounds)
        skView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        gameView.addSubview(skView)
        
        // Create Scene with the correct size
        gameScene = SKScene(size: gameView.bounds.size)
        gameScene.backgroundColor = .cyan
        
        // Setup physics world
        gameScene.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        // Set scene scale mode to fill
        gameScene.scaleMode = .resizeFill
        
        skView.presentScene(gameScene)
        
        // Remove any potential gaps
        skView.ignoresSiblingOrder = true
        skView.clipsToBounds = true
        gameView.clipsToBounds = true
    }
    
    
    @objc func updateTimer() {
        timeRemaining -= 1
        timerLabel.text = "Time: \(timeRemaining)"
        
        if timeRemaining <= 0 {
            endGame()
        }
    }
    
    @objc func createBubble() {
        let bubbleSize: CGFloat = 60
        
        // Create a parent node for the balloon
        let balloonNode = SKNode()
        balloonNode.name = "bubble" // Set name on parent node
        
        // Create the balloon part (circle)
        let bubbleNode = SKShapeNode(circleOfRadius: bubbleSize/2)
        bubbleNode.name = "bubble" // Set name on bubble part too
        
        // Random position at bottom
        let bubbleX = CGFloat.random(in: bubbleSize...(gameScene.size.width - bubbleSize))
        balloonNode.position = CGPoint(x: bubbleX, y: 0)
        
        // Random color for the balloon
        let balloonColor = UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 0.8
        )
        
        bubbleNode.fillColor = balloonColor
        bubbleNode.strokeColor = .white
        bubbleNode.lineWidth = 2.0
        
        // Create the balloon string
        let stringNode = SKShapeNode()
        stringNode.name = "bubble" // Set name on string too
        let stringPath = CGMutablePath()
        stringPath.move(to: CGPoint(x: 0, y: -bubbleSize/2))
        stringPath.addCurve(
            to: CGPoint(x: 0, y: -bubbleSize),
            control1: CGPoint(x: -5, y: -bubbleSize * 0.7),
            control2: CGPoint(x: 5, y: -bubbleSize * 0.9)
        )
        stringNode.path = stringPath
        stringNode.strokeColor = .white
        stringNode.lineWidth = 1.5
        
        // Add both parts to the balloon node
        balloonNode.addChild(bubbleNode)
        balloonNode.addChild(stringNode)
        
        gameScene.addChild(balloonNode)
        
        // Add some floating animation
        let floatDuration: TimeInterval = 0.5
        let floatDistance: CGFloat = 5.0
        
        let floatUp = SKAction.moveBy(x: 0, y: floatDistance, duration: floatDuration)
        let floatDown = SKAction.moveBy(x: 0, y: -floatDistance, duration: floatDuration)
        let floatSequence = SKAction.sequence([floatUp, floatDown])
        let floatForever = SKAction.repeatForever(floatSequence)
        
        // Combine floating with upward movement
        let moveUp = SKAction.moveTo(y: gameScene.size.height + bubbleSize, duration: 6.0)
        let removeAction = SKAction.removeFromParent()
        
        balloonNode.run(SKAction.group([floatForever, SKAction.sequence([moveUp, removeAction])]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: gameScene)
        let touchedNodes = gameScene.nodes(at: location)
        
        for node in touchedNodes {
            if node.name == "bubble" {
                // Get the parent balloon node if we touched a child node
                if let parent = node.parent, parent.name == "bubble" {
                    popBubble(parent)
                } else {
                    popBubble(node)
                }
                break
            }
        }
    }
    
    func popBubble(_ balloon: SKNode) {
        // Stop the balloon's movement
        balloon.removeAllActions()
        
        score += 1
        scoreLabel.text = "Score: \(score)"
        
        // Pop animation
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.15)
        let fadeOut = SKAction.fadeOut(withDuration: 0.15)
        let remove = SKAction.removeFromParent()
        let popSequence = SKAction.sequence([SKAction.group([scaleUp, fadeOut]), remove])
        
        // Add a slight rotation for more natural popping
        let randomRotation = SKAction.rotate(byAngle: .random(in: -0.5...0.5), duration: 0.15)
        balloon.run(SKAction.group([popSequence, randomRotation]))
    }
    
}

