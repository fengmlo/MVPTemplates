package ${ativityPackageName};

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;

import com.jess.arms.base.BaseActivity;
import com.jess.arms.di.component.AppComponent;
import com.jess.arms.utils.ArmsUtils;

import ${componentPackageName}.Dagger${pageName}Component;
import ${moudlePackageName}.${pageName}Module;
import ${contractPackageName}.${pageName}Contract;
import ${presenterPackageName}.${pageName}Presenter;

import ${packageName}.R;

import static com.jess.arms.utils.Preconditions.checkNotNull;

public class ${pageName}Activity extends BaseActivity<${pageName}Presenter> implements ${pageName}Contract.View {
    @Override
    public void setupActivityComponent(AppComponent appComponent) {
        Dagger${pageName}Component //if can't find this class, try compile this project
                .builder()
                .appComponent(appComponent)
                .${extractLetters(pageName[0]?lower_case)}${pageName?substring(1,pageName?length)}Module(new ${pageName}Module(this))
                .build()
                .inject(this);
    }

    @Override
    public int initView(Bundle savedInstanceState) {
        return R.layout.${activityLayoutName}; // if you want to setContentView(id) yourself, return 0
    }

    @Override
    public void initData(Bundle savedInstanceState) {

    }

    @Override
    public void showLoading() {
        // uncomment this code when use SwipeRefreshLayout
        //Observable.just(1)
        //        .observeOn(AndroidSchedulers.mainThread())
        //        .subscribe(integer -> mSwipeRefreshLayout.setRefreshing(true));
    }

    @Override
    public void hideLoading() {
        // uncomment this code when use SwipeRefreshLayout
        //Observable.just(1)
        //        .observeOn(AndroidSchedulers.mainThread())
        //        .subscribe(integer -> mSwipeRefreshLayout.setRefreshing(false));
    }

    @Override
    public void showMessage(@NonNull String message) {
        checkNotNull(message);
        ArmsUtils.snackbarText(message);
    }

    @Override
    public void launchActivity(@NonNull Intent intent) {
        checkNotNull(intent);
        ArmsUtils.startActivity(intent);
    }

    @Override
    public void killMyself() {
        finish();
    }
}
