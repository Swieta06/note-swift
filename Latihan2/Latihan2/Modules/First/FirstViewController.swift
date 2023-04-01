//
//  FirstViewController.swift
//  Latihan2
//
//  Created by MacBook Pro on 20/03/23.
//

import UIKit

class FirstViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var timer:Timer?
    
    var onboardingList:[Onboarding]=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadOnboardingList()
        collectionView.dataSource=self
        
        //ini animasi
        //UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
        collectionView.delegate=self
        timer=Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block:{
            [weak self] _ in
            guard let `self`=self else {return}
            let currenPage=Int(self.collectionView.contentOffset.x /
                               self.collectionView.frame.width)
            let nextPage=currenPage+1>=self.onboardingList.count ? 0 :
            currenPage+1
            let indexPath=IndexPath(item: nextPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self.pageControl.currentPage=nextPage
            
        })
            
    }
    deinit{
        timer?.invalidate()
    }
    
    
    //MARK: - UICollectionDataSourch
    // untuk memberi tahu berapa banyak data yang akan ditampilkan
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingList.count
    }
    //ini bisa liat di viewcontroller -> atribut inspector -> identifier
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "onboarding_cell", for: indexPath) as! OnboardingViewCell
        let onboarding=onboardingList[indexPath.item]
        cell.imageView.image=UIImage(named: onboarding.image)
        cell.titleLable.text=onboarding.title
        cell.subtitleLable.text=onboarding.subtitle
        
        return cell
    }
        //MARK: UIcollectionViewDelagateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width=UIScreen.main.bounds.width
        return CGSize(width: width, height: 500)
    }
    //MARK:- Action
    
    @IBAction func singupButtonTapped(_ sender: Any) {
        showPinViewController()
    }
    
    //MARK: UIcollectionViewDelagate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page=Int(scrollView.contentOffset.x/scrollView.frame.width)
        pageControl.currentPage=page
    }
    //MARK: -Action
    
    @IBAction func pageControlValueChaged(_ sender: Any) {
        let page=pageControl.currentPage
        collectionView.scrollToItem(at: IndexPath (item:page,section:0), at: .centeredHorizontally, animated: true)
    }
    //MARK: - Helper
    func loadOnboardingList(){
        onboardingList=[
        Onboarding(image: "img_onboarding1", title: "Gain total control of your money", subtitle: "Become your own money manager and make every cent count"),
        Onboarding(image: "img_onboarding2", title: "Know where your money goes", subtitle: "Track your transaction easily, with categories and financial report"),
        Onboarding(image: "img_onboarding3", title: "Planning ahead", subtitle: "Setup your budget for each category so you in control")
        ]
        pageControl.numberOfPages=onboardingList.count
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
