Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4919463FC
	for <lists+drbd-dev@lfdr.de>; Fri,  2 Aug 2024 21:37:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC6E3420643;
	Fri,  2 Aug 2024 21:37:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 633DD420639
	for <drbd-dev@lists.linbit.com>; Fri,  2 Aug 2024 21:37:41 +0200 (CEST)
Received: by mail-il1-f177.google.com with SMTP id
	e9e14a558f8ab-39aeccc64e8so3306575ab.2
	for <drbd-dev@lists.linbit.com>; Fri, 02 Aug 2024 12:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1722627460;
	x=1723232260; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Aq0OPmiAfzDwBhbEkdc5d+5HiIl+Llio3iq8YdlnX14=;
	b=YDJa9GxJfVojbsWLo6uYT3oyZhxDlo/HQjT1UNXTur3YBK+6/d9XGYZi5d3U48cJzG
	WTmDzCb0hfH14SYtHILa7sMWDUkpmHutQivNHPHmBjceEmwK/O1R99KTvos6ze9iYEo4
	9yNOI5isubsofr/XmVIPxa58A9PYVYMSe+QpxwBrSuOr7swBqMklUJSuBS4dCngBsM2U
	TVgRBu0zoAUekyDk7IcSaZqUpbUz7iXTO2JmyFvG8mvlDWsBPltVMMrWEHxm09QTrxWb
	JgvbWDwjVgh/I/tn9v0AeGBsh4j+wPb1y6FnmRlt8WhNo31nZRG12Cekn4XCkpQpUMZ6
	hJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1722627460; x=1723232260;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Aq0OPmiAfzDwBhbEkdc5d+5HiIl+Llio3iq8YdlnX14=;
	b=FZkA9wW1WglNauwR9PiBryJYWlmub3gvZjoWTcz+hPKDmPsoWTq6oMHHmHYkowfvQ7
	jMsXqNJhPh980FB6L0RXw1lnpe5Pe33MyZ9Cb2VwpQ/DCvNkmhoacYdDizhyM4ppvTzh
	oExJe3RSI3FDjO2oJkqBMsBXldL3cukwi9FvEt/Q3favtwfY3RjP55xcmrmHbeYtEi0t
	BqJQwLTsj+0jAPMIi8igcdga4O6iZOlFnEukIfla4Mq3AewvWZVqXjtBy/I1TNqd3yCr
	UAv8JlaQOX4XhgUTJhb08SlUbrs6aZ8/bKb4H5yEPaCEDya6QstolYweR4Yp2I8lcEDG
	c1dg==
X-Gm-Message-State: AOJu0YwfVhSUtMqyEoT6pfSrkvhcUVqH4066Rd3m/hsaPdoxZQZszppQ
	d/ZQrv8YUuAewkda0s9uTuBvvHdZbVqAV1cYHy5AYITB+6HvniXuCf3oYG2+gbM=
X-Google-Smtp-Source: AGHT+IF38B2WBsg1Z9PGLO03sa2FOioYxYdCZ030WghdBOYn5rYnHGGG2VBaYVKz14EzsjdIgN7zTA==
X-Received: by 2002:a05:6e02:1c21:b0:383:297a:bdfb with SMTP id
	e9e14a558f8ab-39b1fb736eemr34987515ab.2.1722627460233; 
	Fri, 02 Aug 2024 12:37:40 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	e9e14a558f8ab-39b209d833esm9710825ab.0.2024.08.02.12.37.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 02 Aug 2024 12:37:39 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, brauner@kernel.org, 
	Yue Haibing <yuehaibing@huawei.com>
In-Reply-To: <20240802095147.2788218-1-yuehaibing@huawei.com>
References: <20240802095147.2788218-1-yuehaibing@huawei.com>
Subject: Re: [PATCH -next] drbd: Remove unused extern declarations
Message-Id: <172262745942.170878.5478919565358638351.b4-ty@kernel.dk>
Date: Fri, 02 Aug 2024 13:37:39 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com


On Fri, 02 Aug 2024 17:51:47 +0800, Yue Haibing wrote:
> Commit b411b3637fa7 ("The DRBD driver") declared but never implemented
> drbd_read_remote(), is_valid_ar_handle() and drbd_set_recv_tcq().
> And commit 668700b40a7c ("drbd: Create a dedicated workqueue for sending acks on the control connection")
> never implemented drbd_send_ping_wf().
> 
> Commit 2451fc3b2bd3 ("drbd: Removed the BIO_RW_BARRIER support form the receiver/epoch code")
> leave w_e_reissue() declaration unused.
> 
> [...]

Applied, thanks!

[1/1] drbd: Remove unused extern declarations
      commit: f48ada402d2f1e46fa241bcc6725bdde70725e15

Best regards,
-- 
Jens Axboe



