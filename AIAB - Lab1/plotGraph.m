function [] = plotGraph(in, out, k,t)
    % k is figure number
    % t is title of the graph
    

    class1 = [];
    class2 = [];

    for i = 1:length(out)
        if out(i) == 0
            class1 = [class1, in(:,i)];
        else
            class2 = [class2, in(:,i)];
        end
    end
    
%     x = (linspace(0,1,11))*0.5 + 0.5;
%     y = (linspace(0,1,11))*0.5 + 0.5;
     
    figure(k); scatter(class1(1,:),class1(2,:),100,'o');
    hold on;
    scatter(class2(1,:),class2(2,:),100,'x');
    legend('Outputs 0', 'Outputs 1','Location','east');
    axis([-0.1 1.1 -0.1 1.1]);
    title(t);
    xlabel('Input 1');
    ylabel('Input 2');
%     plot(x,y,'r'); % Plot the decision boundary
    hold off;
    
end