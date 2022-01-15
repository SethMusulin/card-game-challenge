import React, {useState, useEffect} from 'react'
import axios from 'axios'

const Hand = () => {
    const [hand, setHand] = useState([])
    

    const onClick = () => {
        axios.get('/api/hands')
            .then((resp) => {
                setHand(resp.data.data)
            })
    }
    return (
        <div className='handContainer'>
            <button onClick={onClick}>Deal</button>
            {hand.id &&
            <div>
                <div>{hand.attributes.player_1}</div>
                <div>{hand.attributes.player_2}</div>
            </div>
            }
        </div>

    )
};

export default Hand