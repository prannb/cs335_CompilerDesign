import IO;

class List {
    float value = 10.0;
    List next;

	public void set_value(float x) {
        this.value = x;
	}

    public void set_next(List next) {
        this.next = next;
    }

	public void main() {
		IO io = new IO();

		List[10] linked_list;
        
        for (int i = 0; i < 10; i++) {
            linked_list:[i] = new List();
            linked_list:[i].set_value(2.0 * i);
        }
        
        for (int i = 0; i < 9; i++) {
			linked_list:[i].set_next(linked_list:[i+1]); 
        }


		List a = linked_list:[0];

        for (int i = 0; i < 10; i++) {
			io.print_float(a.value);
			io.print_char(10);
			a = a.next;
        }
	}
}