Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3842D9310
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5E985420822;
	Mon, 14 Dec 2020 06:56:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
	[209.85.166.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 680404202B2
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:07 +0100 (CET)
Received: by mail-il1-f174.google.com with SMTP id c18so12764143iln.10
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=544VwD3Mhs0Xuxvhsfgp5Im6wSTqZB+INCdW7VYxKkM=;
	b=ezjb1jIKp/ECo1YoG58+QFgxgeGf0NOzSDcGn929YhFeDXx3jqZu5sr/II7KX0R0On
	ER2FdmrBmYjT8vyTbOIxTsJHiLliBQZ+4Ajt125dibkHP0X44+7d0lZlW0RfVIe5nN8n
	RQ3M10XDWRYlSYhIP+FDxTReOS4259G1QQzCcJd0dEKU4PvfTRWgOM/8GnYtXFIlk0bp
	5u9v1GRzx3NHv5bytg8llvhmXcphOisTKboqbJY+vE5aP/x38VIsYRpTvhSAh64nQnUX
	B10IMoSzl2LHdOmP+mRoSdl6k+S72aKDFGEUSNDnJnW+qyWuQ21BmqhX1Dz9XN7Z04mS
	Q2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=544VwD3Mhs0Xuxvhsfgp5Im6wSTqZB+INCdW7VYxKkM=;
	b=TfNbCAVxCoXiQLav9/PW402gTqEPagqwkLt069wWuj02RNmz3jg0oTp+UXWe0CA7pH
	b9KYflO9tFQ1mneGxU+srp0DzJAjn5pfEKhD6GyqujP15NQ37JQNueSwHS9UqYZPwrVB
	b0FsPP+1eMGaN9rq8mHszjUHT0VQ8raS0fHNP+UBjfaS8wJmyXZT+lnOEFmjJWXDU/h8
	jGr7RbYHQu30SUODl0VAup02jgMhSAcvKy1bG1myPXxDqElxAS0jujzEx3qfguZ6HBVn
	0pPqSZ3PzDfMGRoo2ljf92mLxyIU/0Gy1cvI8ivOcWjksyFlKzKvrbvsQxW38O/LA0Bu
	QAkw==
X-Gm-Message-State: AOAM533N4GbzGQ4kjJAK5W+1lHxbPpArDVTJ1tg/ZC/xq5i8ql7F2F+Y
	YLNdQRBNm8OzjTuWR1gefeC1fHUm2ScHyQ==
X-Google-Smtp-Source: ABdhPJxBF2FO8LBPSzZA4gYKNKJEXHir2tbZF+6YoEUjp2LqR5fR+0hrk85DjyY+Ts9rXuG3s2aiNQ==
X-Received: by 2002:a92:4907:: with SMTP id w7mr26826935ila.130.1607839146171; 
	Sat, 12 Dec 2020 21:59:06 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:05 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:51 -0500
Message-Id: <20201213055859.3305-1-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] Get drbd-9.0 branch building with Linux 5.9 and 5.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hey, everyone! I had the chance to try building the latest drbd-9.0
code against the 5.9 and 5.10 kernels this afternoon. Things almost
built, but not quite.  I made a series of commits to get things
compiling.  Most of it is trivial compat test changes and following
along w/ what's already been done in the mainline drbd8 module to get
it ready for 5.10.

I did not create a compat test for the switch from
sched_setscheduler() to sched_set_fifo_low() yet.  Mostly, because
I've never done that and have to wrap my head around how to add
another test. ;-)

I tried submitting a pull request via github, but got the auto-close
message.  So, here's take two.


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
