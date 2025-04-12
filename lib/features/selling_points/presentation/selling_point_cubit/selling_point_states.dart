abstract class SellingPointStates {}

class SellingPointInitialState extends SellingPointStates {}

class SellingPointTappedState extends SellingPointStates {}


class OrderAddItemState extends SellingPointStates {}
class OrderDeleteItemState extends SellingPointStates {}
class OrderClearItemState extends SellingPointStates {}
class changeItemCountState extends SellingPointStates {}
