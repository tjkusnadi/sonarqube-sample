package hello

import "testing"

func TestMain(t *testing.T) {
	result := HelloWorld()
	expected := "Hello, World!"

	if result != expected {
		t.Errorf("got %q, wanted %q", result, expected)
	}
}
