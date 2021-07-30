//
//  TableViewController.swift
//  Table_P
//
//  Created by HyoEun Kwon on 2021/07/23.
//

import UIKit

//----------------------------------- 변수선언을 Class 정의 전에 : 프로젝트가 관리하는 변수 (처음뜨는 화면에 정의)
// 즉, Class 밖에 선언한 이유 : 전체 프로젝트에서 사용하기 위함 (다른 ViewController 에서도 사용 가능)
var items = ["책 기록", "흐르는 시간", "매일 쓰기" ]
var itemsImageFile = ["cart.png","clock.png","pencil.png"]

class TableViewController: UITableViewController {

    // 연결시 꼭 UItableView라고 나와야 함 (table cell 안됨)
    @IBOutlet var tvListView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        //--------------------------------------------------------
        // Edit 버튼을 만들고 삭제 기능 추가하기, 왼쪽으로 배치
        self.navigationItem.leftBarButtonItem = self.editButtonItem
 
    } // viewDidLoad

    // MARK: - Table view data source
    // -------------------------------------------- cell 구성 시작
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

         //Configure the cell...
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: itemsImageFile[indexPath.row])
        
        return cell
    }
    
    
    // -------------------------------------------- cell 구성 끝

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    //---------------------------------------------- Table 셀 삭제
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            // 삭제 일 경우
            items.remove(at: indexPath.row) // 책이름 지정해둔거 지워줘 (테이블리스트에서 받아오는 cell번호를 통해서)
            itemsImageFile.remove(at: indexPath.row) // 이미지도 지워줘
            //-------------------------- 데이터 삭제 끝!
            
            //-------------------------- 테이블뷰도 삭제 해줘야함!
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    //---------------------------------------------- 삭제시 Delete 글씨를 삭제로 변경하기
    // titleForDeleteConfirmationButtonForRowAt
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    //---------------------------------------------- 목록 순서 바꾸기
    // from, to
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        //fromIndexPath = 현재위치, to : 이동할 위치
        
        //1. 뭘 이동하겠느냐? (= 해당 위치 알기: 저장해두고, => 삭제하고 , => 삽입)
        // 이동할 item위치
        let itemToMove = items[fromIndexPath.row]
        let itemImageToMove = itemsImageFile[fromIndexPath.row] // 얘네들을 가지고 이동 할 거다!
        
        //2. 집 비워두기 (삭제)
        // 이동할 item을 삭제
        items.remove(at: fromIndexPath.row)
        itemsImageFile.remove(at: fromIndexPath.row)
        
        //3. 이사
        // 해당 위치로 삽입
        items.insert(itemToMove, at: to.row) // itemToMove(위치와 저장된 아이템)를 to!(변수이름) 의 index로 변경
        itemsImageFile.insert(itemImageToMove, at: to.row)
        
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    //----------------------------------------------상세정보 보기
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //for는 사용자에게 보여지기 위한 argument
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "sgDetail"{
            // cell 타입으로 바꿔서 가져 올 것 ----- 몇번째 클릭했는지 정보 가져오기 : sender를 통해
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell) // sender의 정보에서 indexPath 가져오기
            //----> 몇번째 클릭한거야 알수 있음
            //--------------------------셀 정보 알기

            //-------------연결, 어디로 줄지
            let detailView = segue.description as! DetailViewController // segue 통해 detailview 연결
            detailView.receiveItems(items[indexPath.row])
        }
        
    }//prepare
    

}//---
