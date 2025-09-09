import React, {useCallback, useState, useEffect} from "react";

export default function App({csrfToken, basketId}) {

  const [runningTotal, setRunningTotal] = useState("0");
  const [productCodes, setProductCodes] = useState([]);

  const actionForProductCode = (code) => {
    return async () => {
      const response = await fetch(`/baskets/${basketId}/product_items.json`, {
        method: 'POST',
        headers: {
          'X-CSRF-Token': csrfToken,
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
          product_item: {
            product_code: code
          }
        })
      });
      const responseJson = await response.json();
      const {total_price, product_items} = responseJson.basket;
      //alert(JSON.stringify(product_items));
      setRunningTotal(total_price);
      setProductCodes(product_items.map(item => item.product_code));
    };
  }


  const onClickGR1 = useCallback(() => {
    
    (async () => {
      const action = actionForProductCode('GR1');
      const response = await action();
    })();
    
  }, [basketId, csrfToken]);

  const onClickSR1 = useCallback(() => {
    
    (async () => {
      const action = actionForProductCode('SR1');
      const response = await action();
    })();
    
  }, [basketId, csrfToken]);

  const onClickCF1 = useCallback(() => {
    
    (async () => {
      const action = actionForProductCode('CF1');
      const response = await action();
    })();
    
  }, [basketId, csrfToken]);  


    const onClickClearAll = useCallback(() => {
    
    (async () => {
      const response = await fetch(`/baskets/${basketId}.json`, {
        method: 'DELETE',
        headers: {
          'X-CSRF-Token': csrfToken,
          'Content-Type': 'application/json'
        }
      });
      const responseJson = await response.json();
      const {total_price, product_items} = responseJson.basket;
      setRunningTotal(total_price);
      setProductCodes(product_items.map(item => item.product_code));
    })();
    
  }, [basketId, csrfToken]);  

  useEffect(() => {

    (async () => {
      const response = await fetch(`/baskets/${basketId}.json`, {
        method: 'GET'
      });
      const responseJson = await response.json();
      const {total_price, product_items} = responseJson.basket;
      setRunningTotal(total_price);
      setProductCodes(product_items.map(item => item.product_code));
    })();

  }, []);

  return (
    <div className="mx-auto w-3/4">
      <h1 className="block text-2xl">Cash Register</h1>
      <div className="h-50 border-blue-400 border-1 rounded-md w-full">
        {productCodes.join(",")}
      </div>
      <div className="h-20 rounded-md w-full text-3xl"> = €{Number(runningTotal).toFixed(2)}</div>
      <div>
        <button onClick={onClickGR1} className="bg-blue-400 text-white cursor-pointer p-3 m-2 rounded-full">GR1 - Green Tea</button>
        <button onClick={onClickSR1} className="bg-blue-400 text-white cursor-pointer p-3 m-2 rounded-full">SR1 - Strawberries</button>
        <button onClick={onClickCF1} className="bg-blue-400 text-white cursor-pointer p-3 m-2 rounded-full">CF1 - Coffee</button>
        <button onClick={onClickClearAll} className="bg-blue-400 text-white cursor-pointer p-3 m-2 rounded-full">CLEAR ALL</button>
      </div>
    </div>   
  )
}
