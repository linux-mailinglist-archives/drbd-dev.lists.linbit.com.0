Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA518328E
	for <lists+drbd-dev@lfdr.de>; Thu, 12 Mar 2020 15:13:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A3A564203EC;
	Thu, 12 Mar 2020 15:13:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 974 seconds by postgrey-1.31 at mail19;
	Thu, 12 Mar 2020 15:13:50 CET
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C72AD4203E2
	for <drbd-dev@lists.linbit.com>; Thu, 12 Mar 2020 15:13:50 +0100 (CET)
Received: by mail-qk1-f195.google.com with SMTP id c145so6336494qke.12
	for <drbd-dev@lists.linbit.com>; Thu, 12 Mar 2020 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EAKahOyoRZpP52TEBHKVYpNKFgVvwEzfLgAa5uIpx40=;
	b=GaoPNuEVWSzOzLgdViobPNhYnZEOXhUhNZ/ffNDB0NjVakD6WwCiV2g3GR79TrN5L1
	KTwhas5Qh5htmL8xs3+yXVxkMDQd9/KTUgyXqaZsXOJh1scVYXJuVQVNCxhU0oSd6xn8
	MwIRJ3valEVODM1h82k8kxjwjU6BO8tBZEmMGqqUF1Xv3Kzs0MsdWd/4QTjiIVejotiX
	raenYB9xnu4tXN8fbwxVvFe4HfaEBFzZnhl2ExAx0ZxN28QcMDPHA9je1LI457TTjecr
	/gL1LeTcfsp9ZRGf3Rdwa0LKMAs1cpXZ7dV/umd8Uh+w/WOr+nCFLWpUVK8ei/ubBR2U
	gBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EAKahOyoRZpP52TEBHKVYpNKFgVvwEzfLgAa5uIpx40=;
	b=NuwJhas8Gz10myIkW5AgQQQOZuiL20V/IhmOyWXjgfT2aqNFVFU3T0QT8EaW8O8A8B
	Ik8vG2hW+FKx57A8MI1mmZI0h5nHFYneQYmqIiEKyZj26rRS9SDV3ozI7fev+nWBfTw5
	8ysSQSH+xVHODOzxGTI6m4Q82FBWMtrDsssTB+OfszdAH7Ityp+KOa6f6Xxqlieo+kFf
	SRHsi0tP5GR81NSesIGH9gA1I0nJIi/6wM9wivuwXRgI/zW8y7UQwZr+p9H7gSlyJIxa
	yT+fkaTw7doC5yiCqQZUty7JXCTar/7H0bq9qs7NWhTOlN0Pzb+DM4kcNobi8ekB7mY1
	mkWA==
X-Gm-Message-State: ANhLgQ1Q47Z2h3Z1ugpTySjwgarw+Q7zd573E8Jx8jPBQT7w2ksP++G+
	6tKJak52kANRJamQnVFw3LvCHp4jEYf6Cg==
X-Google-Smtp-Source: ADFU+vv0O1XzXQN2OxZC4vbjVHkTrkhgs45454tnkk0Ac/rfBpHvqtQJfql+q40S0NgtT/6EkRM5WA==
X-Received: by 2002:a02:76c2:: with SMTP id z185mr7887647jab.76.1584020961530; 
	Thu, 12 Mar 2020 06:49:21 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id p13sm2214278ili.2.2020.03.12.06.49.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Mar 2020 06:49:21 -0700 (PDT)
To: Jackie Liu <liuyun01@tj.kylinos.cn>
References: <20200307023925.20789-1-liuyun01@tj.kylinos.cn>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <116082a5-7942-3215-c81f-50253376a6fd@kernel.dk>
Date: Thu, 12 Mar 2020 07:49:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200307023925.20789-1-liuyun01@tj.kylinos.cn>
Content-Language: en-US
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block/drbd: delete invalid function
	drbd_md_mark_dirty_
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 3/6/20 7:39 PM, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> We deleted last_md_mark_dirty long ago, this function no longer needs to
> exist, delete it, otherwise a compilation error will occur when DEBUG is
> opened.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
