import React, {useState, useEffect} from 'react'
import axios from 'axios'
import styled from 'styled-components'
import Hand from "./hand";

const History = styled.div`
width: 100%;
display: flex;
align-items: center;
min-height: 210px;
justify-content: center;
 
table, th, td {
  border: 1px solid black;
  }
 td{
  padding: 1rem;
 } 
`

const HandHistory = (deal) => {
    const [history, setHistory] = useState([])
    const [player1Wins, setPlayer1Wins] = useState(0)
    const [player2Wins, setPlayer2Wins] = useState(0)
    const [pushes, setPushes] = useState(0)
    useEffect(() => {
        axios.get('/api/deals/')
            .then((resp) => {
                setHistory(resp.data.data);
                calculateAndSetTotals(resp.data.data)
            })
    }, [deal])

    const calculateAndSetTotals = (response) => {
        let p1 = 0
        let p2 = 0
        let push = 0
        response.forEach((deal) => {
            if (deal.attributes.winner === "Player 1") ++p1
            if (deal.attributes.winner === "Player 2") ++p2
            if (deal.attributes.winner === 'Push') ++push
        })
        setPlayer1Wins(p1)
        setPlayer2Wins(p2)
        setPushes(pushes)
    }

    return (
        <History>
            {history.length > 0 ?
                <table>
                    <tbody>
                    <tr>
                        <th>Player 1:  {player1Wins}</th>
                        <th>Player 2:  {player2Wins}</th>
                        <th>Winner</th>
                    </tr>
                    </tbody>
                    <tbody>
                    {history.map((deal) =>
                        <tr key={deal.id}>
                            <td>
                                <Hand player="Player 1" cards={deal.attributes.player_1}/>
                            </td>
                            <td>
                                <Hand player="Player 2" cards={deal.attributes.player_2}/>
                            </td>
                            <td>{deal.attributes.winner}</td>
                        </tr>
                    )}
                    </tbody>
                </table>
                :
                <>
                </>
            }
        </History>
    )
}

export default HandHistory